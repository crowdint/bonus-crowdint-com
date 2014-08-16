Fabricator(:event) do
  opens_at { Time.now }
  team
end
