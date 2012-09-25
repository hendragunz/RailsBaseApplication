module ApplicationHelper
  def sort_url(token)
    if Rails.env == 'production'
      "http://st.pt/#{token.to_s}"
    else
      "http://st.pt:7000/#{token.to_s}"
    end
  end
end
