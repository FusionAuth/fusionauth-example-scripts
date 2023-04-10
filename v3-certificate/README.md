# X.509 V3 Certificate Generator

This sample script automatically generates an X.509 V3 Certificate using RSA and uploads it to the [Key Master](https://fusionauth.io/docs/v1/tech/core-concepts/key-master) in your FusionAuth instance.

### Usage

Create an [API Key](https://fusionauth.io/docs/v1/tech/apis/authentication#api-key-authentication) in your FusionAuth instance that allows POSTing to `/api/key/import` and run `generate-certificate`.

It will ask for three values:
- 
- `Your FusionAuth instance URL (with scheme)`: the complete address for your instance (e.g. `http://localhost:9011`).
- `API Key with /api/key/import endpoint`: actual value for the API Key you've created.
- `Name for the generated key`: a descriptive name for the key. 

After providing the necessary values, it will automatically issue a certificate and upload it to the Key Master in your instance under the name you provided.
