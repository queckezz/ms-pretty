
@require "ms-parse"

export pretty

#
# Convert `ms` into a pretty printed time string.
#
# Examples:
#   343564753 => 52d 20h 42m 24s 
#   302 => 302ms
#   12379 => 12.4s
#

function pretty (ms)
  ret = String[]
  time = parse(ms)

  if ms < 1000
    return post(time["milliseconds"], "ms")
  end

  add!(ret, time["days"], "d")
  add!(ret, time["hours"], "h")
  add!(ret, time["minutes"], "m")
  
  # Display `ms` to `s` when `s` is the highest
  # unit of time

  if time["hours"] == 0
    rms = int(round(time["milliseconds"] / 1000, 1) * 10)
    s = string(time["seconds"]) * "." * string(rms)
    add!(ret, s, "s")
  else
    add!(ret, time["seconds"], "s")
  end

  final = join(ret, " ")
  return final
end

#
# push Any `val` to the given Array `ret` only if
# `val` is not 0
#

function add! (ret::Array, val, postfix::String)
  if val != 0
    push!(ret, post(val, postfix))
  end
end

#
# Add `value` together wth `postfix` as a string.
#

post (val, postfix) = string(val) * string(postfix)