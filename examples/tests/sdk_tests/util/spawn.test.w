bring util;
bring expect;

let assertThrows = inflight (expected: str, block: (): void) => {
  let var error = false;
  try {
    block();
  } catch actual {
    assert(actual.contains(expected));
    error = true;
  }
  assert(error);
};


test "spawn() with successful execution" {
  let program = "echo";
  let args = ["Hello, Wing!"];
  
  let child = util.spawn(program, args, { });
  let output = child.wait();

  expect.equal(output.stdout, "Hello, Wing!\n");
  expect.equal(output.status, 0);
}

// test "spawn() with non-existent program" {
//   let program = "no-such-program";
//   let args = [""];

//   assertThrows("Error: spawn no-such-program ENOENT", () => {
//     util.spawn(program, args);
//   });
// }

test "spawn() and wait for terminated program" {
  let program = "sleep";
  let args = ["1"];

  let child = util.spawn(program, args);
  util.sleep(2s);
  let output = child.wait();

  expect.equal(child.pid, 0);
}


// test "spawn() and kill process" {
//   let program = "sleep";
//   let args = ["2"];

//   let child = util.spawn(program, args);
//   let output = child.wait();
//   child.kill();

//   expect.notEqual(output.status, 0);
// }