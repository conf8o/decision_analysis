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

DF.filter(mountains, elevation > mean(elevation))
|> IO.inspect()

# ------
# テキストのやつ
# ------


### DataFrame ###

df = DataFrame.new(
  index: ["row1", "row2", "row3"],
  column1: [1, 2, 3],
  column2: [4, 5, 6]
)
IO.inspect(df)

# df.indexに相当するものは無さそう。
# 新しく列を追加したいときは、DataFrame.put や DataFrame.mutate


### Series ###

series_1 = Series.from_list([7, 8])
IO.inspect(series_1)

# Seriesには、indexに相当するものは無い(https://hexdocs.pm/explorer/Explorer.Series.html#module-series-queries)


# 所感: pandasのDataFrameの読みにくい演算の挙動を排除しているイメージ
