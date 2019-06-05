require 'csv'

CSV.generate("", force_quotes: true) do |csv|
  cols = {
    title:    ->(issue) { issue.title.slice(0..29) },
    body:     ->(issue) { issue.body.slice(0..49) },
    html_url: ->(issue) { issue.html_url },
  }

  @issues.each do |issue|
    csv << cols.map {|k, col| col.call(issue) }
  end
end
