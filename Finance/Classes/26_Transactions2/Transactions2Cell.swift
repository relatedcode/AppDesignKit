//
// Copyright (c) 2021 Related Code - https://relatedcode.com
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

//-----------------------------------------------------------------------------------------------------------------------------------------------
class Transactions2Cell: UITableViewCell {

	@IBOutlet var imageTransactionStatus: UIImageView!
	@IBOutlet var labelTransaction: UILabel!
	@IBOutlet var labelTransactionInfo: UILabel!
	@IBOutlet var labelAmount: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func awakeFromNib() {

		super.awakeFromNib()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: IndexPath, data: [String: String]) {

		guard let name = data["name"] else { return }
		guard let status = data["status"] else { return }
		guard let date = data["date"] else { return }
		guard let time = data["time"] else { return }
		guard let amount = data["amount"] else { return }

		var imageName = "arrow.up"
		if (status == "Sent") { imageName = "arrow.up" }
		if (status == "Received") { imageName = "arrow.down" }
		if (status == "Paid") { imageName = "checkmark" }
		imageTransactionStatus.image = UIImage(systemName: imageName)
		labelTransaction.text = name
		labelTransactionInfo.text = status + " • " + date + " " + time
		labelAmount.text = ((status == "Received") ? "+" : "-") + amount
	}
}
