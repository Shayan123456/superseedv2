local function run(msg, matches)
 if matches[1]:lower() == 'ip' or matches[1]:lower() == 'clash' or matches[1]:lower() == 'clantag' or matches[1]:lower() == 'tag' then
  local ip = matches[2]
  end
  ip = string.upper(ip)
  local curl = curl 'curl -X POST --include 'https://community-neutrino-ip-info.p.mashape.com/ip-info' \-H 'X-Mashape-Key: 2jU4G9t0hdmshvpTsjFuJmBCz1e3p1MxKQ1jsnX7MSuLLecVXZ' \-H 'Content-Type: application/x-www-form-urlencoded' \-H 'Accept: application/json' \-d 'ip=''..ip..' \-d 'reverse-lookup=false'
  cmd = io.popen(curl)
  
  local result = cmd:read('*all')
  local jdat = json:decode(result)
if jdat.valid then
      if jdat.valid: == 'false' then return ':))' end
   return '#Error\n'..jdat.reason
  end
  local text = 'Clan Tag: '.. jdat.valid
     text = text..'\nClan Name: '.. jdat.region
     text = text..'\nDescription: '.. jdat.country
     text = text..'\nType: '.. jdat.city
     text = text..'\n@shayan123hacker' -- اینو پاک کنی کل کد حرام میشه در ضمن ننه هرکی که اینو پاک یا عوض کنه :))
     cmd:close()
  return text
 end
 end

return {
   patterns = {
"^[/!](ip) (.*)$",
   },
   run = run
}