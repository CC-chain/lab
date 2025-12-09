{{/*
Expand the name of the chart.
*/}}
{{- define "mono-app-backend.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "mono-app-backend.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "mono-app-backend.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "mono-app-backend.labels" -}}
helm.sh/chart: {{ include "mono-app-backend.chart" . }}
{{ include "mono-app-backend.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "mono-app-backend.selectorLabels" -}}
app.kubernetes.io/name: {{ include "mono-app-backend.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "mono-app-backend.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "mono-app-backend.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "external-secrets-name" -}}
{{ include "mono-app-backend.fullname" . }}-secrets
{{- end -}}

{{- define "cluster-secrets-store" -}}
{{ include "mono-app-backend.fullname" . }}-secrets-store
{{- end -}}

{{- define "cluster-parameter-store" -}}
{{ include "mono-app-backend.fullname" . }}-parameter-store
{{- end -}}

{{- define "external-parameters-name" -}}
{{ include "mono-app-backend.fullname" . }}-parameters
{{- end -}}