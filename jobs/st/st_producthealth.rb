require_relative '../producthealth_module'
require_relative '../configuration_helper'

st_config = Helpers::ConfigHelper.new({
    job_prefix: "st_",
    col_count: 2,
    job_css: "medium_font",
    components: [
    {
      ci_root: "",
      jobs: {
        "Application Version" => "Application Version",
        "DynamoDB Table Status" => "DynamoDB Table Status"
      },
    }]
});

SCHEDULER.every '10s', :first_in => 0 do |job|
  ProductHealth::Product.updateUsing st_config
end