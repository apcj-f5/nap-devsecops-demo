import http from "k6/http";
import { check } from "k6";

// See https://k6.io/docs/using-k6/options
export const options = {
  // stages: [{ duration: "1m", target: 1 }],
  thresholds: {
    checks: ["rate<0.02"], // http errors should be less than 2%
    http_req_failed: ["rate<0.02"], // http errors should be less than 2%
    http_req_duration: ["p(95)<2000"], // 95% requests should be below 2s
  },
};

const BASE_URL = "https://bank.f5labs.dev";
const USERNAME = "alice";
const PASSWORD = "bankofanthos";

export default function main() {
  const res = http.post(`${BASE_URL}/login/`, {
    username: USERNAME,
    password: PASSWORD,
  });

  check(res, { "status is 200": (r) => r && r.status === 200 });
}
