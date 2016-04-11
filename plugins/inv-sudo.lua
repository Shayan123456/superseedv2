--Created by @MehdiHS
--Telegram.me/MehdiHS
do

local function callback(extra, success, result)
  vardump(success)
  vardump(result)
end

local function run(msg, matches)
 if matches[1] == 'adddeveloper' then
        chat = 'channel#'..msg.to.id
        user1 = 'user#'..87160007
        channel_invite(channel, user1, callback, false)
	return "Adding Bot develper..."
      end
 
 end

return {
  description = "Invite Sudo and Admin", 
  usage = {
    "/addsudo : invite Bot Sudo", 
	},
  patterns = {
    "^[#!/](adddeveloper)",
  }, 
  run = run,
}


end
