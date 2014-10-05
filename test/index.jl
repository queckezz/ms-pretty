
@require "../"

suite("it should pretty milliseconds") do
  val = pretty(500)
  @test contains(val, "ms")
end

suite("it should pretty seconds") do
  val = pretty(1203)
  @test contains(val, "s")
  @test contains(val, ".")
end

suite("it should pretty full time") do
  val = pretty(12034375678)
  println(val)
  @test contains(val, "d")
  @test contains(val, "h")
  @test contains(val, "m")
  @test contains(val, "s")
end