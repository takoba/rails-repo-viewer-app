# cf.) https://qiita.com/zenpou/items/e391ed22e1e41e75c893
class IssueView < ActionView::Base
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::TagHelper

  def default_url_options
    {}
  end
end

class CSVGenerator

  def issues_to_csv_strings(issues)
    issues.map do |issue|
      @issues = [ issue ]
      view = IssueView.new(Rails.root.join('app', 'views'))
      view.assign instance_variables.each_with_object({}) { |name, hash| hash[name.slice(1, name.length)] = instance_variable_get(name)}
      csv = view.render(template: 'issue/index', format: 'csv').chop!
      csv
    end
  end
end
