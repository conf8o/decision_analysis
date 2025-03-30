alias Explorer.{DataFrame, Series}
require Explorer.DataFrame, as: DF

# ------
# https://github.com/elixir-explorer/explorer
# ------

fruits = Series.from_list(["apple", "mango", "banana", "orange"])

IO.inspect(fruits)
IO.inspect(Series.sort(fruits))

mountains = DataFrame.new(name: ["Everest", "K2", "Aconcagua"], elevation: [8848, 8611, 6962])

IO.inspect(mountains)
DataFrame.print(mountains)

DF.filter(mountains, elevation > mean(elevation))
|> IO.inspect()

# ------
# テキストのやつ
# ------
