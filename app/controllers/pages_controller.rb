class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @ticket = Ticket.new
    @images = [
      'https://images.unsplash.com/photo-1505906960586-b2f5793971ad?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=84f63bfcb360745c5008c9f6e59e3345&auto=format&fit=crop&w=800&q=60',
      'https://images.unsplash.com/photo-1496902526517-c0f2cb8fdb6a?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8a8623f526569e949b73c4c7360d4532&auto=format&fit=crop&w=800&q=60',
      'https://images.unsplash.com/photo-1500049242364-5f500807cdd7?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=835b3fbc757d3cac3e8253f64888279e&auto=format&fit=crop&w=800&q=60',
      'https://images.unsplash.com/photo-1504247143580-b04f71ee96c0?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=e46502c7718c656ad58218e64539c0ed&auto=format&fit=crop&w=800&q=60',
      'https://images.unsplash.com/photo-1507890512529-4b15a5a02988?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=db53f4488d4ef70e68aea8bdf873067a&auto=format&fit=crop&w=800&q=60',
      'https://images.unsplash.com/photo-1505473478993-e61136811cc4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=e6ddd5f8cc9cc9491bbcecfd3147d502&auto=format&fit=crop&w=800&q=60',
      'https://images.unsplash.com/photo-1516321497487-e288fb19713f?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=cbbd27149a8243a42eb2bd0bd918ba8f&auto=format&fit=crop&w=800&q=60',
      'https://images.unsplash.com/photo-1500930290727-955b4310baed?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8f225a0d5e487f3819f44f1e5f9f79ad&auto=format&fit=crop&w=800&q=60',
      'https://images.unsplash.com/photo-1480797571962-18ab07ee47ab?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=b335fd21e7bf636b3c803e060f7144b0&auto=format&fit=crop&w=800&q=60',
      'https://images.unsplash.com/photo-1499951360447-b19be8fe80f5?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=d1046925db0fb1f15417d71ad1676880&auto=format&fit=crop&w=800&q=60',
      'https://images.unsplash.com/photo-1461749280684-dccba630e2f6?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=e5a31d03ddee66863a599421f792e07b&auto=format&fit=crop&w=800&q=60'
    ]
    @image = @images.sample
  end
end
