# Shortener API
### Requirements
- Ruby 2.6.2
- Rails '~> 6.0.3'
- PostgreSQL 10+
- Linux/OSX: Install **libpq-dev**
- JS runtime is not required
### Installing

Setup Ruby version with Rbenv.

`$ rbenv install 2.6.2`

`$ rbenv shell 2.6.2`

Install proper Bundler version (Hacker way)

`grep -A 1 "BUNDLED WITH" Gemfile.lock`

```
BUNDLED WITH
   2.1.4
```

`$ gem install bundler -v 2.1.4`

Install project gemset

`$ bin/bundle install`

Install migrations

`$ rake db:create && rake db:migrate`

Set-up following env variables:

**Mandatory**

`APP_HOST`

**Optional**

`APP_PORT`

PS: Variables above define shortened urls structures

### Deployment
This API is was deployed by Capistrano + Nginx + Puma

### Running tests
$ bundle exec rspec .


**Good to have**:
- API controllers tests recorded with VCR + Fixtures
- Integration Tests (TDD)
- Serializers performance tests
### Browser Lookup
-----------------

This API use Moved **Permanently redirect (301)** approach.

```bash
$ curl -I https://shortener.devpolish.com/cg2s33
```

```json
HTTP/1.1 301 Moved Permanently
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Permitted-Cross-Domain-Policies: none
Referrer-Policy: strict-origin-when-cross-origin
Location: http://google.com/
Content-Type: text/html; charset=utf-8
Cache-Control: no-cache
X-Request-Id: 61f748b4-973f-4ef2-b736-f9f31c83d358
X-Runtime: 0.002773
```

### Documentation
##### Create a new shortened URL
`POST /api/v1/shortened_urls`

```json
{
	"shortened_url": {
		"url": "google.com"
	}  
}
```

`Responses`:

**HTTP 200**

```json
{
    "data": {
        "data": {
            "id": "lg5iso",
            "type": "shortened_url",
            "attributes": {
                "url": "http://google.com/",
                "title": "Google",
                "unique_key": "lg5iso",
                "shortened_url": "https://toryshortener.devpolish.com/lg5iso"
            }
        }
    }
}
```

**HTTP 422**

```json
{
    "errors": "Url can't be blank"
}
```


##### Get top URLs

```json
{
    "result": {
        "data": [
            {
                "id": "o0z2rh",
                "type": "shortened_url",
                "attributes": {
                    "url": "http://facebook.com/",
                    "title": "Facebook - Inicia sesión o regístrate",
                    "unique_key": "o0z2rh",
                    "shortened_url": "http://localhost:3000/o0z2rh"
                }
            },
            {
                "id": "9op442",
                "type": "shortened_url",
                "attributes": {
                    "url": "http://facebook.com/",
                    "title": "Facebook - Inicia sesión o regístrate",
                    "unique_key": "9op442",
                    "shortened_url": "http://localhost:3000/9op442"
                }
            }
        ]
    }
}
```

##### Shortened URL Lookup
`GET /:unique_key`

** HTTP 404**

```json
{
    "errors": "URL not found, check your payload"
}
```

##### Delete shortened URL

** HTTP 404**

```json
{
    "errors": "URL not found, check your payload"
}
```

```json
"result": {
	"data": {
	 	"message": 'URL wad destroyed successfully'
	}
}
```

# Shortener API
### Requirements
- Ruby 2.6.2
- Rails '~> 6.0.3'
- PostgreSQL 10+
- Linux/OSX: Install **libpq-dev**
- JS runtime is not required
### Installing

Setup Ruby version with Rbenv.

`$ rbenv install 2.6.2`

`$ rbenv shell 2.6.2`

Install proper Bundler version (Hacker way)

`grep -A 1 "BUNDLED WITH" Gemfile.lock`

```
BUNDLED WITH
   2.1.4
```

`$ gem install bundler -v 2.1.4`

Install project gemset

`$ bin/bundle install`

Install migrations

`$ rake db:create && rake db:migrate`

Set-up following env variables:

**Mandatory**

`APP_HOST`

**Optional**

`APP_PORT`

PS: Variables above define shortened urls structures

### Deployment
This API is was deployed by Capistrano + Nginx + Puma

### Running tests
$ bundle exec rspec .
**Good to have**:
- API controllers tests recorded with VCR + Fixtures
- Integration Tests (TDD)
- Serializers performance tests
### Browser Lookup
-----------------

This API use Moved **Permanently redirect (301)** approach.

```bash
$ curl -I https://shortener.devpolish.com/cg2s33
```

```json
HTTP/1.1 301 Moved Permanently
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Permitted-Cross-Domain-Policies: none
Referrer-Policy: strict-origin-when-cross-origin
Location: http://google.com/
Content-Type: text/html; charset=utf-8
Cache-Control: no-cache
X-Request-Id: 61f748b4-973f-4ef2-b736-f9f31c83d358
X-Runtime: 0.002773
```

### Documentation
##### Create a new shortened URL
`POST /api/v1/shortened_urls`

```json
{
	"shortened_url": {
		"url": "google.com"
	}  
}
```

`Responses`:

**HTTP 200**

```json
{
    "data": {
        "data": {
            "id": "lg5iso",
            "type": "shortened_url",
            "attributes": {
                "url": "http://google.com/",
                "title": "Google",
                "unique_key": "lg5iso",
                "shortened_url": "https://toryshortener.devpolish.com/lg5iso"
            }
        }
    }
}
```

**HTTP 422**

```json
{
    "errors": "Url can't be blank"
}
```


##### Get top URLs

```json
{
    "result": {
        "data": [
            {
                "id": "o0z2rh",
                "type": "shortened_url",
                "attributes": {
                    "url": "http://facebook.com/",
                    "title": "Facebook - Inicia sesión o regístrate",
                    "unique_key": "o0z2rh",
                    "shortened_url": "http://localhost:3000/o0z2rh"
                }
            },
            {
                "id": "9op442",
                "type": "shortened_url",
                "attributes": {
                    "url": "http://facebook.com/",
                    "title": "Facebook - Inicia sesión o regístrate",
                    "unique_key": "9op442",
                    "shortened_url": "http://localhost:3000/9op442"
                }
            }
        ]
    }
}
```

##### Shortened URL Lookup
`GET /:unique_key`

** HTTP 404**

```json
{
    "errors": "URL not found, check your payload"
}
```

##### Delete shortened URL

** HTTP 404**

```json
{
    "errors": "URL not found, check your payload"
}
```

```json
"result": {
	"data": {
	 	"message": 'URL wad destroyed successfully'
	}
}
```

