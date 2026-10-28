# ConnectWiz Consent — Google Tag Manager template

A Google Tag Manager **tag template** for sites that use the ConnectWiz cookie banner and load their
tags with Tag Manager ("mode B" in ConnectWiz). It implements Google Consent Mode v2:

- every consent signal starts **denied** for every visitor (`security_storage` granted), with
  `wait_for_update` (500 ms by default);
- optional **region rows** open other regions (ISO 3166-2, e.g. `US`, `US-CA`); Türkiye, the EU/EEA,
  the United Kingdom and Switzerland always stay denied — the field refuses them and the code skips them;
- the visitor's **stored choice** (first-party cookie `cwz_consent`, written by the ConnectWiz widget
  code) is re-applied at once, before any other tag runs;
- every **later choice** in the ConnectWiz banner (accept, refuse, change, withdraw) is passed to Tag
  Manager with `updateConsentState`;
- `ads_data_redaction` (on by default) and, optionally, the Microsoft UET (Bing Ads) consent default;
- `url_passthrough` only if you tick it (off by default; ask your legal adviser first — it measures visitors who refused cookies).

Licence: Apache-2.0 (see `LICENSE`).

## Category mapping

| ConnectWiz category | Consent Mode signals                               |
| ------------------- | -------------------------------------------------- |
| Analytics           | `analytics_storage`                                |
| Marketing           | `ad_storage`, `ad_user_data`, `ad_personalization` |
| Functional          | `functionality_storage`, `personalization_storage` |
| Necessary (always)  | `security_storage`                                 |

## Set up

1. In ConnectWiz: **Settings → Integrations → Website → your site → Setup**, choose
   **Google Tag Manager + ConnectWiz consent**, and put the ConnectWiz widget line on every page.
   In this mode the inline ConnectWiz consent stub is **not** used: this template sets the defaults.
2. In Tag Manager: **Templates → Tag Templates → Search Gallery → "ConnectWiz Consent"** (or **New →
   ⋮ → Import** and pick `template.tpl` downloaded from the ConnectWiz panel).
3. **Tags → New → ConnectWiz Consent.** Leave the defaults; add region rows only if the ConnectWiz panel
   has the same region rules (Cookie consent tab).
4. Trigger: **Consent Initialization – All Pages**. Save, preview, publish.
5. On every other tag: Google tags read consent on their own (built-in consent checks). For Meta Pixel,
   TikTok, LinkedIn, Clarity and the rest set **Advanced settings → Consent settings → Require additional
   consent for tag to fire** with the signals of their category (for an ad pixel: `ad_storage`).
6. Optional: fire tags on the ConnectWiz `cwz_*` events (switch "dataLayer events" on in the panel), e.g.
   `cwz_form_submit` with its `event_id`, and on `cwz_consent_update` for tags that wait for a choice.

## How it talks to the ConnectWiz code

A sandboxed template can only use the globals it declares. This one uses:

| Permission                                                                                       | What for                                                                                                                        |
| ------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------- |
| Accesses consent state (write: all seven types; read: `ad_storage`)                              | defaults and updates; the read is only for a debug log line                                                                     |
| Reads cookie value: `cwz_consent`                                                                | the stored choice                                                                                                               |
| Writes data layer: `ads_data_redaction`, `developer_id.*`                                        | `gtagSet`                                                                                                                       |
| Accesses global variables: `cwz.gtm` (read, execute), `cwzq` (read, write), `uetq` (read, write) | hands its listener to the ConnectWiz code (`cwz.gtm(listener)`, or the `cwzq` queue when Tag Manager runs first); the UET queue |
| Logs to console (debug only)                                                                     | preview diagnostics                                                                                                             |

The ConnectWiz code calls the listener with its consent state (`{analytics, marketing, functional, …}`)
on every change.

## Tests

The `___TESTS___` section holds the template's own tests (defaults, regions, the stored choice, updates,
the queue, options). In the ConnectWiz monorepo the same tests, the file structure and the permissions
are also checked outside Tag Manager (`apps/widget/src/consent/gtmTemplate.test.ts`).

## Publishing

The Community Template Gallery takes templates from a **public GitHub repository** that holds exactly one
template: `template.tpl`, `metadata.yaml` and `LICENSE` (Apache-2.0) at its root, on the default branch,
with Issues enabled. Steps for ConnectWiz: docs/rewrite/106 §16 in the ConnectWiz monorepo.
