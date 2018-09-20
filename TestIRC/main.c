#include <stdio.h>
#include <json.h>
#include <curl/curl.h>

struct string {
	char *ptr;
	size_t len;
};

size_t writefunc(void *ptr, size_t size, size_t nmemb, struct string *s)
{
	size_t new_len = s->len + size*nmemb;
	s->ptr = realloc(s->ptr, new_len + 1);
	if (s->ptr == NULL) {
		fprintf(stderr, "realloc() failed\n");
		exit(EXIT_FAILURE);
	}
	memcpy(s->ptr + s->len, ptr, size*nmemb);
	s->ptr[new_len] = '\0';
	s->len = new_len;

	return size*nmemb;
}

void init_string(struct string *s) {
	s->len = 0;
	s->ptr = malloc(s->len + 1);
	if (s->ptr == NULL) {
		fprintf(stderr, "malloc() failed\n");
		exit(EXIT_FAILURE);
	}
	s->ptr[0] = '\0';
}

struct json_object *get_student_data()
{
	struct string s;
	struct json_object *jobj;

	//Intialize the CURL request
	CURL *hnd = curl_easy_init();

	//Initilize the char array (string)
	init_string(&s);

	curl_easy_setopt(hnd, CURLOPT_CUSTOMREQUEST, "GET");
	curl_easy_setopt(hnd, CURLOPT_URL, "http://10.3.4.75:9000/v2/entities?options=keyValues&type=student&attrs=LatLong,activity,calls_duration,calls_made,calls_missed,calls_received,department,location,sms_received,sms_sent");

	//Add headers
	struct curl_slist *headers = NULL;
	headers = curl_slist_append(headers, "cache-control: no-cache");
	headers = curl_slist_append(headers, "fiware-servicepath: /");
	headers = curl_slist_append(headers, "fiware-service: socialite");

	//Set some options
	curl_easy_setopt(hnd, CURLOPT_HTTPHEADER, headers);
	curl_easy_setopt(hnd, CURLOPT_WRITEFUNCTION, writefunc); //Give the write function here
	curl_easy_setopt(hnd, CURLOPT_WRITEDATA, &s); //Give the char array address here

	//Perform the request
	CURLcode ret = curl_easy_perform(hnd);
	if (ret != CURLE_OK){
		fprintf(stderr, "curl_easy_perform() failed: %s\n", curl_easy_strerror(ret));

		/*jobj will return empty object*/
		jobj = json_tokener_parse(s.ptr);

		/* always cleanup */
		curl_easy_cleanup(hnd);
		return jobj;

	}
	else if (CURLE_OK == ret) {
		jobj = json_tokener_parse(s.ptr);
		free(s.ptr);

		/* always cleanup */
		curl_easy_cleanup(hnd);
		return jobj;
	}

}

int main(void)
{
	//JSON obect
	struct json_object *jobj_array, *jobj_obj;
	struct json_object *jobj_object_id, *jobj_object_type, *jobj_object_activity, *jobj_object_location, *jobj_object_latlong, *jobj_object_callsduration, 
	*jobj_object_callsmade, *jobj_object_callsmissed, *jobj_object_callsreceived, *jobj_object_department, *jobj_object_smsreceived, *jobj_object_smssent;
	enum json_type type = 0;
	int arraylen = 0;
	int i;
	
	jobj_array = get_student_data();
	printf("jobj from str:\n---\n%s\n---\n", json_object_to_json_string_ext(jobj_array, JSON_C_TO_STRING_SPACED | JSON_C_TO_STRING_PRETTY));
	
	arraylen = json_object_array_length(jobj_array);

	for (i = 0; i < arraylen; i++) {
		// get the i-th object in jobj_array
		jobj_obj = json_object_array_get_idx(jobj_array, i);
		// get the name attribute in the i-th object
		jobj_object_id = json_object_object_get(jobj_obj, "id");
		jobj_object_type = json_object_object_get(jobj_obj, "type");
		jobj_object_activity = json_object_object_get(jobj_obj, "activity");
		jobj_object_location = json_object_object_get(jobj_obj, "location");
		jobj_object_callsduration = json_object_object_get(jobj_obj, "calls_duration");
		jobj_object_callsmade = json_object_object_get(jobj_obj, "calls_made");
		jobj_object_callsmissed = json_object_object_get(jobj_obj, "calls_missed");
		jobj_object_callsreceived= json_object_object_get(jobj_obj, "calls_received");
		jobj_object_department = json_object_object_get(jobj_obj, "department");
		jobj_object_smsreceived = json_object_object_get(jobj_obj, "sms_received");
		jobj_object_smssent = json_object_object_get(jobj_obj, "sms_sent");
		// print out the name attribute
		printf("id=%s\n", json_object_get_string(jobj_object_id));

		printf("type=%s\n", json_object_get_string(jobj_object_type));
		printf("activity=%s\n", json_object_get_string(jobj_object_activity));
		printf("location=%s\n", json_object_get_string(jobj_object_location));
		printf("Calls duration(s)=%s\n", json_object_get_string(jobj_object_callsduration));
		printf("Calls made=%s\n", json_object_get_string(jobj_object_callsmade));
		printf("Calls missed=%s\n", json_object_get_string(jobj_object_callsmissed));
		printf("Calls received=%s\n", json_object_get_string(jobj_object_callsreceived));
		printf("Department=%s\n", json_object_get_string(jobj_object_department));
		printf("Sms received=%s\n", json_object_get_string(jobj_object_smsreceived));
		printf("Sms sent=%s\n", json_object_get_string(jobj_object_smssent));
		printf("\n");
	}

	return 0;
}