require "json"
require "ibm_watson/authenticators"
require "ibm_watson/natural_language_understanding_v1"
include IBMWatson

text = "I’ve been a loyal adidas customer but I started having issues on their app last month. Their app won’t take my payment. I tried using different credit cards, but I keep getting the same message”Oops, someone went wrong!” The payment was not authorized. I called & emailed customer service many times & they kept telling the problem was fixed but it still not working. I love their products but their customer service is really bad. Adidas should change their vendor that process their credit card payment. I understand the company is being careful because of fraud, but this is ridiculous. Their payment system is too sensitive."

authenticator = Authenticators::IamAuthenticator.new(
  apikey: "OLQXmFBvzM-7Ls2O4EnJPRTwBNoqWI2QSO6Z34aLr8JB"
)

natural_language_understanding = NaturalLanguageUnderstandingV1.new(
  version: "2021-03-25",
  authenticator: authenticator
)
natural_language_understanding.service_url = "https://api.eu-gb.natural-language-understanding.watson.cloud.ibm.com/instances/ae1fec12-7f91-4efc-bdf1-5b37e6373007"


response = natural_language_understanding.analyze(
  text: text,
  features: {
    emotion: {},
    sentiment: {},
    keywords: {sentiment: true, emotion: true, limit:3}
  }
)

analyse = JSON.parse(JSON.pretty_generate(response.result))

analyse["keywords"].each do |keyword|
  p keyword["text"]
  p keyword["sentiment"]["score"]
  p keyword["sentiment"]["label"]
  p keyword["emotion"]["sadness"]
end
