local i18n   = require('i18n')
local tablex = require('pl.tablex')
local colors = require('ansicolors')

i18n.load({
  en = {
    app = {
      label   = colors("%{blue}app%{reset}"),
      no_such = colors("no such '%{yellow}%<file>.s%{reset}' in current project")
    },

    provision = {
      label    = colors("%{yellow}image%{reset}"),
      check    = "[%{label}] check image: %{image}",
      detected = colors("[%<label>.s] '%{blue}%<type>.s%{reset}' box type detected"),
      making   = "[%{label}] provision it ...",
      provisioned = "[%{label}] provisioned: %{image}",
      -- Search
      searching = "[%{label}] searching: %{image}",
      already   = "[%{label}] already provisioned: %{image}",
      not_found = "[%{label}] not found: %{image}",
      -- Dependecie
      dependence = {
        searching = "[%{label}] searching depedence: %{image}",
        not_found = "[%{label}] not found depedence: %{image}",
        not_found_it = "[%{label}] not found depedence, making: %{image}"
      }
    },

    exec = {
      label = colors("%{green}exec%{reset}"),
    },
  }
})

i18n.setLocale('en')

function i18n.module(mod)
  local label = i18n(mod .. ".label")
  return function(msg, options)
    options = tablex.merge({ label = label }, options or {}, true)
    return i18n(mod .. "." .. msg, options)
  end
end

return i18n
