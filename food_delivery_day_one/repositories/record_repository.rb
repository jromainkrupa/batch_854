class RecordRepository
  def initialize(filepath)
    # TDO
    @items = []
    @filepath = filepath
    load_csv if File.exists?(filepath)
  end

  def all
    @items
  end

  def create(item)
    item.id = @next_id
    @next_id += 1
    @items << item
    save_csv
  end

  def find(id)
    @items.find { |item| item.id == id }
  end

  private

  def load_csv
    CSV.foreach(@filepath, headers: :first_row, header_converters: :symbol) do |row|
      @items << row_to_record(row)
    end
    @next_id = @items.empty? ? 1 : @items.count + 1
  end

  def save_csv
    CSV.open(@filepath, "wb") do |csv|
      csv << headers
      @items.each do |item|
        csv << record_to_row(item)
      end
    end
  end
end
