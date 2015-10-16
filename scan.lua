local scanFrame

SLASH_QUICKBUY1 = '/quickbuy'
function SlashCmdList.QUICKBUY(cmd)
	if cmd == '' then
		scanFrame = scanFrame or CreateFrame('Frame', nil)
		if scanFrame:GetScript('OnUpdate') then
			scanFrame:SetScript('OnUpdate', nil)
		else
			scanFrame:SetScript('OnUpdate', function()
				if CanSendAuctionQuery() then
					local _, auction_count = GetNumAuctionItems('list')
					local page = auction_count and math.floor(auction_count / 50)				
					QueryAuctionItems(nil, nil, nil, nil, nil, nil, page)
				end
			end)
		end
	end
end

