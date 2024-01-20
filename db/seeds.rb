# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# SUBSCRIPTIONS 
sub_1 = Subscription.create!(title: "Bronze", price: 25, frequency: 3)
sub_2 = Subscription.create!(title: "Silver", price: 45, frequency: 6)
sub_3 = Subscription.create!(title: "Gold", price: 60, frequency: 12)

# TEAS 
tea_1 = Tea.create!(title: "Earl Grey", description: "Combines black tea with bergamot orange extract", temperature: 90, brew_time: 4, subscription_id: sub_1)
tea_2 = Tea.create!(title: "Decaf Tea", description: "Tea without caffine", temperature: 90, brew_time: 5, subscription_id: sub_1)
tea_3 = Tea.create!(title: "Green Tea", description: "Good for lifting your spirits", temperature: 90, brew_time: 4, subscription_id: sub_1)
tea_4 = Tea.create!(title: "Yellow Tea", description: "A rare variety of tea, similar processing as Green Tea", temperature: 88, brew_time: 5, subscription_id: sub_1)
tea_5 = Tea.create!(title: "Herbal", description: "Good aall around for grounding the nerves and boosting the spirits", temperature: 80, brew_time: 7, subscription_id: sub_1)
tea_6 = Tea.create!(title: "Chamomile", description: "Common herbal tea ingredients include herbs and spices like chamomile, peppermint, ginger, lavender, and more", temperature: 89, brew_time: 3, subscription_id: sub_2)
tea_7 = Tea.create!(title: "Assam", description: "Loose Leaf - Black Tea", temperature: 87, brew_time: 4, subscription_id: sub_2)
tea_8 = Tea.create!(title: "Hibiscus Tea", description: "Is derived from the hibiscus plant", temperature: 88, brew_time: 5, subscription_id: sub_2)
tea_9 = Tea.create!(title: "Mint Tea", description: "Herbal mint tea assortment", temperature: 93, brew_time: 7, subscription_id: sub_2)
tea_10 = Tea.create!(title: "Breakfast Tea", description: "Good with any meal, but we suggest first thing to get you going", temperature: 92, brew_time: 2, subscription_id: sub_2)
tea_11 = Tea.create!(title: "Ginger Peach", description: "A taste of sweet and spice, this tea makes a great pair", temperature: 95, brew_time: 3, subscription_id: sub_3)
tea_12 = Tea.create!(title: "Citrus Tea", description: "Nice floral notes to balance the fresh citrus notes", temperature: 90, brew_time: 6, subscription_id: sub_3)
tea_13 = Tea.create!(title: "Honey Ginger Tea", description: "SMooth and warm- best for any day, but especially a cold one", temperature: 91, brew_time: 4, subscription_id: sub_3)
tea_14 = Tea.create!(title: "Floral Tea", description: "Hibiscus notes coupled with rose and lavander", temperature: 92, brew_time: 7, subscription_id: sub_3)
tea_15 = Tea.create!(title: "Chai", description: "Though it's technically a black tea, chai tea has a specific flavor profile and preparation process that differentiates it", temperature: 91, brew_time: 3, subscription_id: sub_3)
