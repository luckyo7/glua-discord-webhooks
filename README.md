# glua-discord-webhooks
Basically passthrough service for all yall weirdos that need discord integration

If you're gonna use my webserver pls don't break TOS ty :)
## Documentation for you weirdo devs out there
* Webhook() - Constructor for webhooks. You can pass arguments of message and username but I don't reccomend
	* Webhook():Set*() - Setter bruh (returns updated value)
	* Webhook():Get*() - Getter bruh
	* Webhook():Send() - Sends the webhook to the url in WEBHOOK table using the object's fields
