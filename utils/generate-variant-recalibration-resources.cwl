class: ExpressionTool
cwlVersion: v1.0
inputs:
  resource_files: File[]
  resource_settings:
    type:
      type: array
      items:
        type: record
        name: resource_setting
        fields:
          name: { type: string }
          known: { type: boolean }
          training: { type: boolean }
          truth: { type: boolean }
          prior: { type: int }
outputs:
  resources:
    type:
      type: array
      items:
        type: record
        name: resource
        fields:
          name: { type: string }
          known: { type: boolean }
          training: { type: boolean }
          truth: { type: boolean }
          prior: { type: int }
          file: { type: File }
requirements:
  InlineJavascriptRequirement: {}
expression: >
  ${
    var resources = [];
    for (var i = 0; i < inputs.resource_files.length; i++) {
      var file = inputs.resource_files[i];
      var settings = inputs.resource_settings[i];
      settings['file'] = file;
      resources.push(settings);
    }
    return {"resources": resources};
  }
