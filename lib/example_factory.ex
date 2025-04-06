defmodule ExampleFactory do
  alias Explorer.DataFrame
  require Explorer.DataFrame, as: DF

  def run() do
    # 利得行列の作成
    # 工場の固定費(万円)
    fixed_cost = 100

    # 機械一台の稼働コスト(万円)
    machine_cost = 600

    # 製品の販売価格(万円)
    selling_price = 0.2

    # 機械一台で生産できる製品の量
    production_per_machine = 5000
    # 好況時の需要量
    boom_demand = 10000

    # 不況時の需要量
    recession_demand = 5000

    example_tables(
      fixed_cost,
      machine_cost,
      selling_price,
      production_per_machine,
      boom_demand,
      recession_demand
    )
  end

  @doc "製品販売数"
  def sales_count(production_count, demand) do
    min(production_count, demand)
  end

  @doc "売上金額"
  def sales_amount(sales_count, selling_price) do
    sales_count * selling_price
  end

  @doc "工場の製造コスト"
  def factory_cost(machines, fixed_cost, machine_cost) do
    fixed_cost + machines * machine_cost
  end

  @doc "利益"
  def profit(sales_amount, factory_cost) do
    sales_amount - factory_cost
  end

  def example_tables(
        fixed_cost,
        machine_cost,
        selling_price,
        production_per_machine,
        boom_demand,
        recession_demand
      ) do
    # 出荷される製品の販売数を表にする

    # 行名
    index = ["好況", "不況"]

    production_count_table =
      DataFrame.new(
        zero: [0, 0],
        one: [
          sales_count(production_per_machine, boom_demand),
          sales_count(production_per_machine, recession_demand)
        ],
        two: [
          sales_count(2 * production_per_machine, boom_demand),
          sales_count(2 * production_per_machine, recession_demand)
        ]
      )

    print_dataframe_with_index(production_count_table, index)
  end

  defp print_dataframe_with_index(df, index) do
    df_with_index = DataFrame.put(df, :index, index)
    colums_with_index = [:index | DataFrame.names(df)]

    df_with_index
    |> DataFrame.select(colums_with_index)
    |> DataFrame.print()
  end
end
