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
    natural_language_understanding.service_url = "https://api.eu-gb.natural-language-understanding.watson.cloud.ibm.com/instances/ae1fec12-7f91-4efc-bdf1-5b37e6373007"


    response = natural_language_understanding.analyze(
      text: @text,
      features: {
        emotion: {},
        sentiment: {}
      }
    )

    JSON.parse(JSON.pretty_generate(response.result))
  end
end
