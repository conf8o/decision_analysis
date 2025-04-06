alias Explorer.DataFrame

df = DataFrame.new(
  column1: [1, 2],
  column2: [3, 4]
)


df_with_index = DataFrame.put(df, :index, ["row1", "row2"])
ordered_columns = [:index | DataFrame.names(df)]

DataFrame.print(DataFrame.select(df_with_index, ordered_columns))
