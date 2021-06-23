require "json"
require "ibm_watson/authenticators"
require "ibm_watson/natural_language_understanding_v1"
include IBMWatson

#AUTHENTIFICATION
authenticator = Authenticators::IamAuthenticator.new(
  apikey: ENV["WATSON_API_KEY"]
)

natural_language_understanding = NaturalLanguageUnderstandingV1.new(
  version: "2021-03-25",
  authenticator: authenticator
)
natural_language_understanding.service_url = "https://api.eu-gb.natural-language-understanding.watson.cloud.ibm.com/instances/ae1fec12-7f91-4efc-bdf1-5b37e6373007"


#ANALYSE
response = natural_language_understanding.analyze(
  text: "Doc Martens are not the classic footwear we know. I bought a pair online and the “leather” was very hard and the left foot was slightly tight. I looked up different ways to stretch them and after it was too late to return them I realised why they didn’t stretch - it isn’t leather. Stay well clear and buy from independents like the British Boot Company in Camden. I’m in my 50’s and I remember going to the shop with my dad. He always had his shoes made to measure there. Just bought a pair of beautiful boots that fitted like a glove",
  features: {
    emotion: {},
    sentiment: {}
  }
)

nlp = JSON.parse(JSON.pretty_generate(response.result))

p nlp["sentiment"]["document"]["label"]
p nlp["sentiment"]["document"]["score"]

