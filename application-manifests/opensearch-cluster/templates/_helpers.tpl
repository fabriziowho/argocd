# count all nodes defined in the nodePools section
{{- define "opensearch.totalNodes" -}}
{{- $total := 0 -}}
{{- range $key, $config := .Values.config.opensearch.nodePools -}}
{{- $total = (add $total $config.count) -}}
{{- end -}}
{{- $total -}}
{{- end -}}

# count data nodes defined in the nodePools section
{{- define "opensearch.dataNodes" -}}
{{- $total := 0 -}}
{{- range $key, $config := .Values.config.opensearch.nodePools -}}
{{- if hasPrefix "data_" $key -}}
{{- $total = (add $total $config.count) -}}
{{- end -}}
{{- end -}}
{{- $total -}}
{{- end -}}
