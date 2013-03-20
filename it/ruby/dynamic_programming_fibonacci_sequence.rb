fib = lambda do |n|
  return 0 if n == 0
  return 1 if n == 1
  return fib.call(n - 1) + fib.call(n - 2)
end

puts fib.call(20)

m = {0 => 0, 1 => 1}
dyn_fib = lambda do |n|
  if m.keys.include? n
    return m[n]
  else
    dyn_fib.call(n - 1) + dyn_fib.call(n - 2)
  end
end

puts fib.call(20)
