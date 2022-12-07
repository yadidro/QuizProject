const PROXY_CONFIG = [
  {
    context: [
      "/questions","/quizResult"
    ],

    target: "https://localhost:7055",
    secure: false
  }
]

module.exports = PROXY_CONFIG;
