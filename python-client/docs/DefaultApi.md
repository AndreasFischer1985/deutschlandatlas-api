# Deutschlandatlas.DefaultApi

All URIs are relative to *https://www.karto365.de/hosting/rest/services*

Method | HTTP request | Description
------------- | ------------- | -------------
[**query**](DefaultApi.md#query) | **GET** /{table}/MapServer/0/query | query


# **query**
> {str: (bool, date, datetime, dict, float, int, list, str, none_type)} query(f)

query

Im JSON-Format lassen sich aktuelle und historische Daten zu ausgewählten Indikatoren über GET-requests folgender Machart erhalten 

### Example


```python
import time
from deutschland import Deutschlandatlas
from deutschland.Deutschlandatlas.api import default_api
from pprint import pprint
# Defining the host is optional and defaults to https://www.karto365.de/hosting/rest/services
# See configuration.py for a list of all supported configuration parameters.
configuration = Deutschlandatlas.Configuration(
    host = "https://www.karto365.de/hosting/rest/services"
)


# Enter a context with an instance of the API client
with Deutschlandatlas.ApiClient() as api_client:
    # Create an instance of the API class
    api_instance = default_api.DefaultApi(api_client)
    f = "json" # str | Output-Format (z.B. 'json' oder 'html').
    out_fields = "*" # str | Auszugebende Variablen/fields (z.B. '*'). (optional)
    return_geometry = False # bool | Boolsche Angabe, ob Angaben zur Geometrie gesendet werden sollen (z.B. 'false'). (optional)
    spatial_rel = "esriSpatialRelIntersects" # str | spational relation (z.B. 'esriSpatialRelIntersects'). (optional)

    # example passing only required values which don't have defaults set
    try:
        # query
        api_response = api_instance.query(f)
        pprint(api_response)
    except Deutschlandatlas.ApiException as e:
        print("Exception when calling DefaultApi->query: %s\n" % e)

    # example passing only required values which don't have defaults set
    # and optional values
    try:
        # query
        api_response = api_instance.query(f, out_fields=out_fields, return_geometry=return_geometry, spatial_rel=spatial_rel)
        pprint(api_response)
    except Deutschlandatlas.ApiException as e:
        print("Exception when calling DefaultApi->query: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **f** | **str**| Output-Format (z.B. &#39;json&#39; oder &#39;html&#39;). |
 **table** | **str**|  Angaben zu allen online vorliegenden Tabellen finden sich [hier](https://www.karto365.de/portal/sharing/rest/search?q&#x3D;deutschlandatlas&amp;f&#x3D;json&amp;num&#x3D;100&amp;start&#x3D;1) und [hier](https://www.karto365.de/portal/sharing/rest/search?q&#x3D;deutschlandatlas&amp;f&#x3D;json&amp;num&#x3D;100&amp;start&#x3D;101)  | defaults to "p_apo_f_ZA2022"
 **where** | **str**| Spezifikation einer gewünschten Teilmenge der Daten (z.B.&#39;1&#x3D;1&#39;). | defaults to "1%3D1"
 **out_fields** | **str**| Auszugebende Variablen/fields (z.B. &#39;*&#39;). | [optional]
 **return_geometry** | **bool**| Boolsche Angabe, ob Angaben zur Geometrie gesendet werden sollen (z.B. &#39;false&#39;). | [optional]
 **spatial_rel** | **str**| spational relation (z.B. &#39;esriSpatialRelIntersects&#39;). | [optional]

### Return type

**{str: (bool, date, datetime, dict, float, int, list, str, none_type)}**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | OK |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

