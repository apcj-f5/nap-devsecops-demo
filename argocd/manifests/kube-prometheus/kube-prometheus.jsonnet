<<<<<<< HEAD
local kp = (import 'kube-prometheus-jsonnet/main.libsonnet') + {
=======
<<<<<<< HEAD
local kp = (import 'kube-prometheus/main.libsonnet') + {
=======
local kp = (import 'kube-prometheus-jsonnet/main.libsonnet') + {
>>>>>>> 0e4b75b (add kube-prometheus jsonnet)
>>>>>>> 1433205 (add kube-prometheus jsonnet)
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
