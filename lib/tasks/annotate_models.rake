# frozen_string_literal: true

if Rails.env.development?
  require "annotate"

  desc "Set annotation options for AnnotateModels"
  task :set_annotation_options do
    # You can override any of these by setting an environment variable of the
    # same name.
    Annotate.set_defaults(
      "models"                    => "true",
      "controllers"               => "false",
      "exclude_tests"             => "true",
      "exclude_fixtures"          => "true",
      "exclude_factories"         => "true",
      "exclude_serializers"       => "true",
      "exclude_scaffolds"         => "true",
      "exclude_controllers"       => "true",
      "exclude_helpers"           => "true",
      "exclude_sti_subclasses"    => "true",
      "model_dir"                 => "app/models",
      "position_in_class"         => "after",
      "show_foreign_keys"         => "true",
      "show_indexes"              => "true",
      "ignore_model_sub_dir"      => "false",
      "ignore_unknown_models"     => "false",
      "hide_limit_column_types"   => "integer,bigint,boolean",
      "hide_default_column_types" => "json,jsonb,hstore",
      "skip_on_db_migrate"        => "false",
      "format_bare"               => "true",
      "with_comment"              => "true",
    )
  end

  Annotate.load_tasks
end
