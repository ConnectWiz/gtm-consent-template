___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "ConnectWiz Consent",
  "categories": [
    "UTILITY",
    "TAG_MANAGEMENT"
  ],
  "brand": {
    "id": "brand_dummy",
    "displayName": "ConnectWiz"
  },
  "description": "Google Consent Mode v2 for sites that use the ConnectWiz cookie banner. Sets every signal to denied by default, re-applies the visitor's stored choice and passes each new choice to Tag Manager. Fire on Consent Initialization - All Pages.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "LABEL",
    "name": "intro",
    "displayName": "Every consent signal starts <strong>denied</strong> for every visitor. The visitor's choice comes from the ConnectWiz cookie banner (the ConnectWiz widget code on the page). Fire this tag on the <strong>Consent Initialization - All Pages</strong> trigger."
  },
  {
    "type": "PARAM_TABLE",
    "name": "regions",
    "displayName": "Region defaults (optional)",
    "help": "Only for visitors outside Türkiye, the EU/EEA, the United Kingdom and Switzerland: these regions always stay denied and cannot be added here. Use ISO 3166-2 codes (US, US-CA, BR), several per row separated by commas. Keep this table the same as the region rules in the ConnectWiz panel (Cookie consent tab).",
    "newRowButtonText": "Add region",
    "paramTableColumns": [
      {
        "param": {
          "type": "TEXT",
          "name": "region",
          "displayName": "Regions (ISO 3166-2, comma separated)",
          "simpleValueType": true,
          "valueValidators": [
            {
              "type": "NON_EMPTY"
            },
            {
              "type": "REGEX",
              "args": [
                "^\\s*(?:[JKOQV-Z][A-Z]|A[A-SU-Z]|B[A-DFH-Z]|C[A-GI-X]|D[A-DF-JL-Z]|E[A-DF-KM-RT-Z]|F[A-HJ-QS-Z]|G[AC-QS-Z]|H[A-QSTV-Z]|I[A-DF-RU-Z]|L[A-HJ-SW-Z]|M[A-SU-Z]|N[A-KMNP-Z]|P[A-KM-SU-Z]|R[A-NP-Z]|S[A-DF-HJL-Z]|T[A-QS-Z]|U[A-JL-Z])(?:-[A-Z0-9]{1,3})?(?:\\s*,\\s*(?:[JKOQV-Z][A-Z]|A[A-SU-Z]|B[A-DFH-Z]|C[A-GI-X]|D[A-DF-JL-Z]|E[A-DF-KM-RT-Z]|F[A-HJ-QS-Z]|G[AC-QS-Z]|H[A-QSTV-Z]|I[A-DF-RU-Z]|L[A-HJ-SW-Z]|M[A-SU-Z]|N[A-KMNP-Z]|P[A-KM-SU-Z]|R[A-NP-Z]|S[A-DF-HJL-Z]|T[A-QS-Z]|U[A-JL-Z])(?:-[A-Z0-9]{1,3})?)*\\s*$"
              ],
              "errorMessage": "Use upper-case ISO 3166-2 codes separated by commas. Türkiye, EU/EEA countries, the United Kingdom and Switzerland always stay denied and cannot be listed."
            }
          ]
        },
        "isUnique": true
      },
      {
        "param": {
          "type": "SELECT",
          "name": "analytics",
          "displayName": "Analytics (analytics_storage)",
          "macrosInSelect": false,
          "selectItems": [
            {
              "value": "denied",
              "displayValue": "Denied"
            },
            {
              "value": "granted",
              "displayValue": "Granted"
            }
          ],
          "simpleValueType": true,
          "defaultValue": "denied"
        },
        "isUnique": false
      },
      {
        "param": {
          "type": "SELECT",
          "name": "marketing",
          "displayName": "Marketing (ad_storage, ad_user_data, ad_personalization)",
          "macrosInSelect": false,
          "selectItems": [
            {
              "value": "denied",
              "displayValue": "Denied"
            },
            {
              "value": "granted",
              "displayValue": "Granted"
            }
          ],
          "simpleValueType": true,
          "defaultValue": "denied"
        },
        "isUnique": false
      },
      {
        "param": {
          "type": "SELECT",
          "name": "functional",
          "displayName": "Functional (functionality_storage, personalization_storage)",
          "macrosInSelect": false,
          "selectItems": [
            {
              "value": "denied",
              "displayValue": "Denied"
            },
            {
              "value": "granted",
              "displayValue": "Granted"
            }
          ],
          "simpleValueType": true,
          "defaultValue": "denied"
        },
        "isUnique": false
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "waitForUpdate",
    "displayName": "Wait for update",
    "simpleValueType": true,
    "defaultValue": 500,
    "valueUnit": "milliseconds",
    "help": "How long Google tags wait for the visitor's stored choice before they send anything. 500 ms is Google's recommendation.",
    "valueValidators": [
      {
        "type": "NON_NEGATIVE_NUMBER"
      }
    ]
  },
  {
    "type": "CHECKBOX",
    "name": "adsDataRedaction",
    "checkboxText": "Redact ads data while ad_storage is denied (ads_data_redaction)",
    "simpleValueType": true,
    "defaultValue": true
  },
  {
    "type": "CHECKBOX",
    "name": "urlPassthrough",
    "checkboxText": "Pass ad click information through page URLs while cookies are refused (url_passthrough)",
    "simpleValueType": true,
    "defaultValue": false,
    "help": "Off by default. When on, Google tags carry the ad click and session information across your own pages in the URL instead of cookies for visitors who refused them. Check with your legal adviser first: it measures visitors who said no to cookies. If you use a Conversion Linker tag, switch URL passthrough on there too."
  },
  {
    "type": "CHECKBOX",
    "name": "uetDefault",
    "checkboxText": "Also tell Microsoft UET (Bing Ads): denied by default, then the visitor's choice",
    "simpleValueType": true,
    "defaultValue": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// ConnectWiz Consent — Google Consent Mode v2 for the ConnectWiz cookie banner.
// Licensed under the Apache License, Version 2.0.
//
// 1. Every signal starts DENIED for every visitor (security_storage granted).
//    Optional region rows open other regions; Türkiye, the EU/EEA, the UK and
//    Switzerland always stay denied, whatever the table says.
// 2. The visitor's stored choice (first-party cookie `cwz_consent`, written by
//    the ConnectWiz widget code) is re-applied at once, before any tag runs.
// 3. Every later choice (the banner, a withdrawal) is passed on: the template
//    hands its listener to the ConnectWiz code (`cwz.gtm`), or queues it in
//    `cwzq` when that code has not loaded yet.
// url_passthrough is set only when the template user ticks it (off by default).

const setDefaultConsentState = require('setDefaultConsentState');
const updateConsentState = require('updateConsentState');
const isConsentGranted = require('isConsentGranted');
const gtagSet = require('gtagSet');
const getCookieValues = require('getCookieValues');
const copyFromWindow = require('copyFromWindow');
const callInWindow = require('callInWindow');
const createQueue = require('createQueue');
const logToConsole = require('logToConsole');
const getTimestampMillis = require('getTimestampMillis');
const makeNumber = require('makeNumber');
const getType = require('getType');
const JSON = require('JSON');

const COOKIE = 'cwz_consent';
// ConnectWiz's Google tag Developer ID, once Google issues it ('' = none).
const DEVELOPER_ID = '';
const GRANTED = 'granted';
const DENIED = 'denied';
const MAX_AGE_MS = 366 * 24 * 60 * 60 * 1000;
// Always denied by default: EU 27 + EEA + United Kingdom + Switzerland +
// Türkiye (and the non-ISO aliases UK and EL).
const LOCKED = ['AT', 'BE', 'BG', 'HR', 'CY', 'CZ', 'DK', 'EE', 'FI', 'FR', 'DE', 'GR', 'HU', 'IE',
  'IT', 'LV', 'LT', 'LU', 'MT', 'NL', 'PL', 'PT', 'RO', 'SK', 'SI', 'ES', 'SE', 'IS', 'LI', 'NO',
  'GB', 'CH', 'TR', 'UK', 'EL'];

const log = (message) => {
  logToConsole('ConnectWiz Consent: ' + message);
};

const states = (analytics, marketing, functional) => {
  const ad = marketing ? GRANTED : DENIED;
  const fn = functional ? GRANTED : DENIED;
  return {
    ad_storage: ad,
    ad_user_data: ad,
    ad_personalization: ad,
    analytics_storage: analytics ? GRANTED : DENIED,
    functionality_storage: fn,
    personalization_storage: fn,
    security_storage: GRANTED
  };
};

const regionsOf = (input) => {
  if (getType(input) !== 'string') return [];
  return input.split(',')
    .map((entry) => entry.trim().toUpperCase())
    .filter((entry) => entry.length > 0);
};

const isLocked = (region) => LOCKED.indexOf(region.split('-')[0]) !== -1;

// A stored choice: {"v":1,"id":"…","ver":"…","c":"101","t":ms} — `c` is
// analytics, marketing, functional as 0/1. Older than a year: none.
const storedChoice = () => {
  const values = getCookieValues(COOKIE) || [];
  for (let i = 0; i < values.length; i++) {
    let stored;
    if (getType(values[i]) === 'string') stored = JSON.parse(values[i]);
    if (getType(stored) !== 'object' || stored.v !== 1) continue;
    if (getType(stored.c) !== 'string' || getType(stored.t) !== 'number') continue;
    const bits = stored.c.split('');
    if (bits.length !== 3) continue;
    if (bits.filter((b) => b === '0' || b === '1').length !== 3) continue;
    if (getTimestampMillis() - stored.t >= MAX_AGE_MS) continue;
    return { analytics: bits[0] === '1', marketing: bits[1] === '1', functional: bits[2] === '1' };
  }
  return null;
};

const uet = data.uetDefault !== false ? createQueue('uetq') : null;

const apply = (choice) => {
  updateConsentState(states(choice.analytics, choice.marketing, choice.functional));
  if (uet) uet('consent', 'update', { ad_storage: choice.marketing ? GRANTED : DENIED });
};

// The ConnectWiz code calls this with its consent state on every change.
const onConsent = (state) => {
  if (getType(state) !== 'object') return;
  const choice = {
    analytics: state.analytics === true,
    marketing: state.marketing === true,
    functional: state.functional === true
  };
  log('choice changed (ad_storage was ' + (isConsentGranted('ad_storage') ? GRANTED : DENIED) + ')');
  apply(choice);
};

let wait = makeNumber(data.waitForUpdate);
if (!(wait >= 0 && wait <= 10000)) wait = 500;

if (DEVELOPER_ID !== '') gtagSet('developer_id.' + DEVELOPER_ID, true);
if (data.adsDataRedaction !== false) gtagSet('ads_data_redaction', true);
if (data.urlPassthrough === true) gtagSet('url_passthrough', true);

const base = states(false, false, false);
base.wait_for_update = wait;
setDefaultConsentState(base);

(data.regions || []).forEach((row) => {
  const all = regionsOf(row.region);
  const open = all.filter((region) => !isLocked(region));
  if (open.length < all.length) log('always-denied regions left out of a region row: ' + all.join(', '));
  if (open.length === 0) return;
  const rowState = states(row.analytics === GRANTED, row.marketing === GRANTED, row.functional === GRANTED);
  rowState.region = open;
  rowState.wait_for_update = wait;
  setDefaultConsentState(rowState);
});

if (uet) uet('consent', 'default', { ad_storage: DENIED });

const stored = storedChoice();
if (stored) apply(stored);

if (getType(copyFromWindow('cwz.gtm')) === 'function') {
  callInWindow('cwz.gtm', onConsent);
} else {
  createQueue('cwzq')(onConsent);
}

data.gtmOnSuccess();


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_consent",
        "versionId": "1"
      },
      "param": [
        {
          "key": "consentTypes",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "ad_storage"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "ad_user_data"
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "ad_personalization"
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "analytics_storage"
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "functionality_storage"
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "personalization_storage"
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "security_storage"
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "get_cookies",
        "versionId": "1"
      },
      "param": [
        {
          "key": "cookieAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "cookieNames",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "cwz_consent"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "write_data_layer",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keyPatterns",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "ads_data_redaction"
              },
              {
                "type": 1,
                "string": "url_passthrough"
              },
              {
                "type": 1,
                "string": "developer_id.*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "cwz.gtm"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "cwzq"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "uetq"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: Denied defaults everywhere
  code: |-
    runCode(mockData);
    assertApi('setDefaultConsentState').wasCalledWith({
      ad_storage: 'denied',
      ad_user_data: 'denied',
      ad_personalization: 'denied',
      analytics_storage: 'denied',
      functionality_storage: 'denied',
      personalization_storage: 'denied',
      security_storage: 'granted',
      wait_for_update: 500
    });
    assertApi('gtagSet').wasCalledWith('ads_data_redaction', true);
    assertApi('gtagSet').wasNotCalledWith('url_passthrough', true);
    assertApi('updateConsentState').wasNotCalled();
    assertApi('gtmOnSuccess').wasCalled();
- name: Region row opens a region, locked regions stay denied
  code: |-
    mockData.regions = [
      {region: 'US, CA', analytics: 'granted', marketing: 'denied', functional: 'granted'},
      {region: 'DE, TR, GB-ENG', analytics: 'granted', marketing: 'granted', functional: 'granted'}
    ];
    runCode(mockData);
    assertApi('setDefaultConsentState').wasCalledWith({
      ad_storage: 'denied',
      ad_user_data: 'denied',
      ad_personalization: 'denied',
      analytics_storage: 'granted',
      functionality_storage: 'granted',
      personalization_storage: 'granted',
      security_storage: 'granted',
      region: ['US', 'CA'],
      wait_for_update: 500
    });
    assertApi('setDefaultConsentState').wasNotCalledWith({
      ad_storage: 'granted',
      ad_user_data: 'granted',
      ad_personalization: 'granted',
      analytics_storage: 'granted',
      functionality_storage: 'granted',
      personalization_storage: 'granted',
      security_storage: 'granted',
      region: ['DE', 'TR', 'GB-ENG'],
      wait_for_update: 500
    });
    assertApi('gtmOnSuccess').wasCalled();
- name: Stored choice is re-applied at once
  code: |-
    mock('getTimestampMillis', 1000000);
    mock('getCookieValues', ['{"v":1,"id":"abcdefgh12","ver":"3","c":"110","t":999000}']);
    runCode(mockData);
    assertApi('updateConsentState').wasCalledWith({
      ad_storage: 'granted',
      ad_user_data: 'granted',
      ad_personalization: 'granted',
      analytics_storage: 'granted',
      functionality_storage: 'denied',
      personalization_storage: 'denied',
      security_storage: 'granted'
    });
    assertApi('gtmOnSuccess').wasCalled();
- name: Expired or malformed stored choice is ignored
  code: |-
    mock('getTimestampMillis', 40000000000);
    mock('getCookieValues', ['{"v":1,"id":"abcdefgh12","ver":"3","c":"111","t":1000}', 'not json', '{"v":1,"c":"1x1","t":1000}']);
    runCode(mockData);
    assertApi('updateConsentState').wasNotCalled();
    assertApi('gtmOnSuccess').wasCalled();
- name: Updates on every change from the ConnectWiz code
  code: |-
    let listener;
    mock('copyFromWindow', function(key) { return key === 'cwz.gtm' ? function() {} : undefined; });
    mock('callInWindow', function(path, fn) { if (path === 'cwz.gtm') listener = fn; });
    runCode(mockData);
    assertApi('updateConsentState').wasNotCalled();
    listener({analytics: false, marketing: true, functional: true, source: 'cwz'});
    assertApi('updateConsentState').wasCalledWith({
      ad_storage: 'granted',
      ad_user_data: 'granted',
      ad_personalization: 'granted',
      analytics_storage: 'denied',
      functionality_storage: 'granted',
      personalization_storage: 'granted',
      security_storage: 'granted'
    });
    listener({analytics: false, marketing: false, functional: false, source: 'cwz'});
    assertApi('updateConsentState').wasCalledWith({
      ad_storage: 'denied',
      ad_user_data: 'denied',
      ad_personalization: 'denied',
      analytics_storage: 'denied',
      functionality_storage: 'denied',
      personalization_storage: 'denied',
      security_storage: 'granted'
    });
- name: Queues its listener when the ConnectWiz code has not loaded yet
  code: |-
    let queued = [];
    mock('copyFromWindow', undefined);
    mock('createQueue', function(name) { return function(a, b, c) { queued.push([name, a, b, c]); }; });
    runCode(mockData);
    assertThat(queued.filter(function(q) { return q[0] === 'cwzq'; }).length).isEqualTo(1);
    assertThat(queued.filter(function(q) { return q[0] === 'uetq' && q[1] === 'consent' && q[2] === 'default'; }).length).isEqualTo(1);
    assertApi('callInWindow').wasNotCalled();
    assertApi('gtmOnSuccess').wasCalled();
- name: URL passthrough only when ticked
  code: |-
    mockData.urlPassthrough = true;
    runCode(mockData);
    assertApi('gtagSet').wasCalledWith('url_passthrough', true);
    assertApi('gtmOnSuccess').wasCalled();
- name: Options switched off
  code: |-
    let queued = [];
    mock('createQueue', function(name) { return function(a, b, c) { queued.push([name, a, b, c]); }; });
    mockData.adsDataRedaction = false;
    mockData.uetDefault = false;
    mockData.waitForUpdate = '1200';
    runCode(mockData);
    assertApi('gtagSet').wasNotCalled();
    assertThat(queued.filter(function(q) { return q[0] === 'uetq'; }).length).isEqualTo(0);
    assertApi('setDefaultConsentState').wasCalledWith({
      ad_storage: 'denied',
      ad_user_data: 'denied',
      ad_personalization: 'denied',
      analytics_storage: 'denied',
      functionality_storage: 'denied',
      personalization_storage: 'denied',
      security_storage: 'granted',
      wait_for_update: 1200
    });
setup: |-
  const mockData = {
    regions: [],
    waitForUpdate: '500',
    adsDataRedaction: true,
    urlPassthrough: false,
    uetDefault: true
  };


___NOTES___

Source: https://github.com/ConnectWiz/gtm-consent-template (Apache-2.0).
Guide: https://github.com/ConnectWiz/gtm-consent-template#readme
