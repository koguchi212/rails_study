FactoryBot.define do
  factory :aim do
    title { "テストを書く" }
    reason { "TDDをするため" }
    advantage { "保守性の向上" }
    user
  end
end
