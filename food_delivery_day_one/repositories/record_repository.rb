class RecordRepository
  def initialize(filepath)
    # TDO
    @elements = []
    @filepath = filepath
    load_csv if File.exists?(filepath)
  end

  def all
    @elements
  end

  def create(element)
    element.id = @next_id
    @next_id += 1
    @elements << element
    save_csv
  end

  def find(id)
    @elements.find { |element| element.id == id }
  end

  private

  def load_csv
    CSV.foreach(@filepath, headers: :first_row, header_converters: :symbol) do |row|
      @elements << row_to_record(row)
    end
    @next_id = @elements.empty? ? 1 : @elements.count + 1
  end

  def save_csv
    CSV.open(@filepath, "wb") do |csv|
      csv << headers
      @elements.each do |element|
        csv << record_to_row(element)
      end
    end
  end
end
