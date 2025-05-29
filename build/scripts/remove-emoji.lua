-- Pandoc Lua filter to handle emoji characters in LaTeX output

function Str(elem)
  -- Replace emoji with text equivalents or remove them
  local replacements = {
    ["🤖"] = "",
    ["📝"] = "",
    ["⚡"] = "",
    ["🪞"] = "",
    ["🧠"] = "",
    ["💡"] = "",
    ["🎯"] = "",
    ["🔍"] = "",
    ["🚀"] = "",
    ["⚠️"] = "",
    ["✅"] = "",
    ["❌"] = "",
    ["📚"] = "",
    ["🔧"] = "",
    ["🌟"] = "",
    ["💭"] = "",
    ["🗣️"] = "",
    ["👤"] = "",
    ["🌐"] = "",
    ["📊"] = "",
    ["🔄"] = "",
    ["➡️"] = "->",
    ["⬆️"] = "^",
    ["⬇️"] = "v",
    ["↔️"] = "<->",
  }

  -- Apply replacements
  for emoji, replacement in pairs(replacements) do
    elem.text = elem.text:gsub(emoji, replacement)
  end

  -- Remove any remaining Unicode characters that might cause issues (optional)
  -- elem.text = elem.text:gsub("[%z\1-\127\194-\244][\128-\191]*", "")

  return elem
end
