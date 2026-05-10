terminal = "ghostty"
app = hs.application.find(terminal)

hs.hotkey.bind({ "ctrl" }, "t", function()
  if app:isFrontmost() then
    app:hide()
  else
    hs.application.launchOrFocus(terminal)
  end
end)
