local kp = (import 'main.libsonnet') + {
  values+:: {
    common+: {
      namespace: 'kube-prometheus',
    },
  },
};

[kp.kubePrometheus[name] for name in std.objectFields(kp.kubePrometheus)] +
[kp.prometheusOperator[name] for name in std.objectFields(kp.prometheusOperator)] +
[kp.nodeExporter[name] for name in std.objectFields(kp.nodeExporter)] +
[kp.kubeStateMetrics[name] for name in std.objectFields(kp.kubeStateMetrics)] +
[kp.prometheus[name] for name in std.objectFields(kp.prometheus)] +
[kp.prometheusAdapter[name] for name in std.objectFields(kp.prometheusAdapter)]
