class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @ticket = Ticket.new
    @images = ["https://images.unsplash.com/photo-1496902526517-c0f2cb8fdb6a?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8a8623f526569e949b73c4c7360d4532&auto=format&fit=crop&w=800&q=60",
      "https://images.unsplash.com/photo-1513711487224-63b774e12f4d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=f91db53208eea75c32e680b8aa8012be&auto=format&fit=crop&w=800&q=60",
      "https://images.unsplash.com/photo-1485988412941-77a35537dae4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=c9476459aede4e37dbbf9a2153d6377c&auto=format&fit=crop&w=800&q=60",
      "https://images.unsplash.com/photo-1505473478993-e61136811cc4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=e6ddd5f8cc9cc9491bbcecfd3147d502&auto=format&fit=crop&w=800&q=60",
      "https://images.unsplash.com/photo-1444653614773-995cb1ef9efa?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=3f60b9caab490df3472bffaddfb52246&auto=format&fit=crop&w=800&q=60",
      "https://images.unsplash.com/photo-1445019980597-93fa8acb246c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=871a02b242b32565bf5ca078f370ef13&auto=format&fit=crop&w=800&q=60",
      "https://images.unsplash.com/photo-1475094276386-8a8776e8dfa1?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=45a5b3bf464167f7134c456ab6a23280&auto=format&fit=crop&w=1653&q=80",
      "https://images.unsplash.com/photo-1480797571962-18ab07ee47ab?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=b335fd21e7bf636b3c803e060f7144b0&auto=format&fit=crop&w=1650&q=80",
      "https://images.unsplash.com/photo-1493514789931-586cb221d7a7?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=f8ab2656cca1f3fadd0cc4e254b27c8d&auto=format&fit=crop&w=1651&q=80",
      "https://images.unsplash.com/photo-1493087670264-2f7f5844b402?ixlib=rb-0.3.5&s=1d948790e06c2489da1b933d13601670&auto=format&fit=crop&w=1649&q=80",
      "https://images.unsplash.com/photo-1421757295538-9c80958e75b0?ixlib=rb-0.3.5&s=ffc5f2d44b5b70078fbb014566e48bfc&auto=format&fit=crop&w=1653&q=80",
      "https://images.unsplash.com/photo-1483058712412-4245e9b90334?ixlib=rb-0.3.5&s=c1058ecb478c4833b4cbf3133d7d10f1&auto=format&fit=crop&w=800&q=60"
    ]
    @image = @images.sample
  end
end
