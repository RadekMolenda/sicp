def fast_exp(b, n)
  if n == 0
    1
  elsif n.even?
    fast_exp(b, n / 2) ** 2
  else
    b * fast_exp(b, n - 1)
  end
end

def fast_exp_iter(b, n, a)
  if n == 0
    a
  elsif n.even?
    fast_exp_iter(b**2, n / 2, a)
  else
    fast_exp_iter(b, n - 1, b * a)
  end
end

def fast_exp_i(b, n)
  fast_exp_iter(b, n, 1)
end

def fast_exp_ruby(b, n)
  x, y, z = b, n, 1
  (0...n).each do |m|
    if m.even?
      x, y, z = x**2, y / 2, z
    else
      x, y, z = x, y - 1, x * z
    end
  end
  z
end
