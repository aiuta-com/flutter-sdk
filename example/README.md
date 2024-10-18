# Aiuta Digital Try On Example

Demonstrates how to use the Aiuta Flutter plugin.

## Getting Started

Example app loads environment variables from the `.env` file.

Create a `.env` file in the root of example project and
define your variables there. Example of file:

```
SAMPLES_API_KEY=YOUR_API_KEY_HERE
SAMPLES_SUBSCRIPTION_ID=YOUR_SUBSCRIPTION_ID_HERE
SAMPLES_SKU_ID=YOUR_SKU_ID_HERE
SAMPLES_SKU_CATALOG_NAME=YOUR_SKU_CATALOG_NAME_HERE
```

And then build Env class with `dart run build_runner build` command inside `/example` folder
