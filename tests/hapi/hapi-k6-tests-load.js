import http from "k6/http";
import { check } from "k6";

// See https://k6.io/docs/using-k6/options
export const options = {
  stages: [
    { duration: "15s", target: 2000 },
    { duration: "1m", target: 2000 },
    { duration: "15s", target: 0 },
  ],
};

export default function main() {
  let response = http.get("https://hapi.f5labs.dev/");
}
