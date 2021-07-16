defmodule Rocketpay.Numbers do
  # criando uma função para ler o arquivo
  def sum_from_file(filename) do
    # pipe operator, funciona para passar params/args(somente como primeiro arg) de uma lugar para outros
    "#{filename}.csv"
    |> File.read()
    |> handle_file()
  end

  # função para lidar com o File que pode retornar file ou error usando pattern match
  defp handle_file({:ok, result}) do
    result =
      result
      |> String.split(",")
      |> Stream.map(fn number -> String.to_integer(number) end)
      |> Enum.sum()

    {:ok, %{result: result}}
  end

  defp handle_file({:error, _reason}), do: {:error, %{message: "Invalid File"}}
end
