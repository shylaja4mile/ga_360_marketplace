project_name: "block-ga-360"


################ Constants ################

# Used in google_analytics_block.model connection param
constant: CONNECTION_NAME {
  value: "looker-private-demo"
  export: override_required
}

# Used in ga_sessions.view sql_table_name
constant: SCHEMA_NAME {
  value: "bigquery-public-data.google_analytics_sample"
  export: override_required
}

constant: GA360_TABLE_NAME {
  value: "ga_sessions_*"
  export: override_required
}

constant: CONFIG_PROJECT_NAME {
  value: "ga_360_config_dev"
  export: override_required
}

constant: PDT_DATE_FILTER {
  value: "last 5 years"
  export: override_required
}

constant: EXPLORE_DATE_FILTER {
  value: "last 5 years"
  export: override_required
}

constant: CONFIG_PROJECTNAME {}

################ Dependencies ################

local_dependency: {
  project: "@{CONFIG_PROJECT_NAME}"

  override_constant: GA360_TABLE_NAME {
    value: "@{GA360_TABLE_NAME}"
  }

  override_constant: SCHEMA_NAME {
    value: "@{SCHEMA_NAME}"
  }

  override_constant: EXPLORE_DATE_FILTER {
    value: "@{EXPLORE_DATE_FILTER}"
  }
}

# Reference in LookML dashboard using tile
# type: block-ga-360::block-ga-360-sankey
visualization: {
  id: "block-ga-360-sankey"
  url: "https://looker-custom-viz-a.lookercdn.com/master/sankey.js"
  label: ""
}
