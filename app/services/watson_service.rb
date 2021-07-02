require "json"

class WatsonService
  include IBMWatson
  def initialize(text)
    @text = text
  end

  def analyse
    authenticator = Authenticators::IamAuthenticator.new(
      apikey: ENV["WATSON_API_KEY"]
    )

    natural_language_understanding = NaturalLanguageUnderstandingV1.new(
      version: "2021-03-25",
      authenticator: authenticator
    )
    natural_language_understanding.service_url = "https://api.eu-gb.natural-language-understanding.watson.cloud.ibm.com/instances/12ed5a68-6868-461b-9fb8-a3208f37d7fc"


    response = natural_language_understanding.analyze(
      text: @text,
      features: {
        emotion: {},
        sentiment: {},
        keywords: {sentiment: true, emotion: true, limit:3}
      }
    )

    JSON.parse(JSON.pretty_generate(response.result))
  end
end
