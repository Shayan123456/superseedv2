 do
    
function run(msg, matches)

 local text = matches[1]
  
    local num = matches[2]
  
  local s = ''
for i=1, text, 1 do

s = '\n'..num..''..s
i = i + 1
end
return s


         end
return {
    patterns = {
      "^[/!#]spam (.*) (.*)$"
    },
    run = run,
}
end
