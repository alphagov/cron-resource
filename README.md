# Crontab Resource

***Note this is a GOV.UK Pay maintained fork of [vmware-archive/cron-resource](https://github.com/vmware-archive/cron-resource)***

Implements a resource that reports new versions when the current time
matches the crontab expression

---
## Update your pipeline

Update your pipeline to include this new declaration of resource types. See the example pipeline yml snippet below or the Concourse docs for more details [here](https://concourse.ci/configuring-resource-types.html).
```
---
resource_types:
- name: cron-resource
  type: registry-image
  source:
    repository: governmentdigitalservice/pay-cron-resource

resources:
  - name: 10-min-trigger
    type: cron-resource
    source:
      expression: "*/10 * * * *"
      location: "America/New_York"
      fire_immediately: true
```

## Source Configuration

* `expression`: *Required.* The crontab expression:

    |field       | allowed values |
    |-------------|----------------|
    |minute       | 0-59 |
    |hour         | 0-23 |
    |day of month | 1-31 |
    |month        | 1-12 (or names, see below) |
    |day of week  | 0-7 (0 or 7 is Sun, or use names) |

  e.g.

    `0 23 * * 1-5` # Run at 11:00pm from Monday to Friday

* `location`: *Optional.* Defaults to UTC. Accepts any timezone that
  can be parsed by https://godoc.org/time#LoadLocation

  e.g.

  `America/New_York`

  `America/Vancouver`

* `fire_immediately`: *Optional.* Defaults to false. Immediately triggers the resource the first time it is checked.

## Behavior

### `check`: Report the current time.

Returns `time.Now()` as the version only if a minute since we last
fired matches the crontab expression. The first time the script runs
it will fire if a minute in the last hour matches the crontab
expression.

#### Parameters

*None.*

### `in`: Report the given time

If triggered by `check`, returns the original version as the resulting
version.

#### Parameters

1. *Output directory.* The directory where the in script will store
   the requested version

### `out`: Not supported.

## Developer Notes

You can test the behavior by simulating Concourse's invocations. For example:

```
$ echo '{"source":{"expression":"* * * * *","location":"America/New_York"}}' \
  | go run ./check
[{"time":"2016-08-19T10:15:27.183011117-04:00"}]
```

## Vulnerability Disclosure

GOV.UK Pay aims to stay secure for everyone. If you are a security researcher and have discovered a security vulnerability in this code, we appreciate your help in disclosing it to us in a responsible manner. Please refer to our [vulnerability disclosure policy](https://www.gov.uk/help/report-vulnerability) and our [security.txt](https://vdp.cabinetoffice.gov.uk/.well-known/security.txt) file for details.
