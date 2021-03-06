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
class Profile2View: UIViewController {

	@IBOutlet var tableView: UITableView!

	@IBOutlet var viewHeader: UIView!
	@IBOutlet var imageUser: UIImageView!
	@IBOutlet var labelUsername: UILabel!
	@IBOutlet var labelUserInfo: UILabel!
	@IBOutlet var labelFollowers: UILabel!
	@IBOutlet var labelFollowing: UILabel!

	@IBOutlet var buttonTab1: UIButton!
	@IBOutlet var buttonTab2: UIButton!
	@IBOutlet var buttonTab3: UIButton!

	@IBOutlet var viewTab1: UIView!
	@IBOutlet var viewTab2: UIView!
	@IBOutlet var viewTab3: UIView!

	private var news: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "@relatedcode"
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		let buttonAddList = UIBarButtonItem(image: UIImage(systemName: "text.badge.plus"), style: .plain, target: self, action: #selector(actionAddList(_:)))
		let buttonMore = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: #selector(actionMenu(_:)))
		navigationItem.rightBarButtonItems = [buttonAddList, buttonMore]

		tableView.register(UINib(nibName: "Profile2Cell", bundle: Bundle.main), forCellReuseIdentifier: "Profile2Cell")

		updateUI()
		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageUser.sample("Reader", "Politics", 24)
		labelUsername.text = "New York Times"
		labelUserInfo.text = "News Channel"
		labelFollowers.text = "1.4K"
		labelFollowing.text = "9697"
		buttonTab1.isSelected = true

		news.removeAll()

		var dict1: [String: String] = [:]
		dict1["name"] = "Fox News"
		dict1["date"] = "17 MAR 2020"
		dict1["title"] = "My Life on Italy???s Coronavirus Frontlines, and in Quarantine"
		dict1["description"] = "I rushed back from a family ski trip to report on the sudden outbreak across North Italy. It was the last time I would touch my kids for a month."
		dict1["comments"] = "322"
		dict1["views"] = "30.1k"
		news.append(dict1)

		var dict2: [String: String] = [:]
		dict2["name"] = "NBC News"
		dict2["date"] = "24 MAR 2020"
		dict2["title"] = "Under U.S. Aid Plan, C.E.O.s Could Still Receive Millions: Live Business Updates"
		dict2["description"] = "Live updates on stock market and business news during the coronavirus outbreak."
		dict2["comments"] = "910"
		dict2["views"] = "40.8k"
		news.append(dict2)

		var dict3: [String: String] = [:]
		dict3["name"] = "BBC News"
		dict3["date"] = "15 MAR 2020"
		dict3["title"] = "Military Judge in 9/11 Trial at Guant??namo Is Retiring"
		dict3["description"] = "Col. W. Shane Cohen had served on the case for less than a year and set a January 2021 jury selection date that now appears uncertain."
		dict3["comments"] = "468"
		dict3["views"] = "30.3k"
		news.append(dict3)

		var dict4: [String: String] = [:]
		dict4["name"] = "Washington Examiner"
		dict4["date"] = "14 MAR 2020"
		dict4["title"] = "Economic Crisis Prompts a Showdown, and a Shutdown, in Suriname"
		dict4["description"] = "The coronavirus pandemic is but one factor in a confrontation between the South American nation???s business sector and its authoritarian government."
		dict4["comments"] = "139"
		dict4["views"] = "37.8k"
		news.append(dict4)

		var dict5: [String: String] = [:]
		dict5["name"] = "The Atlantic"
		dict5["date"] = "14 MAR 2020"
		dict5["title"] = "???None of Us Saw It Ending This Way???: Peace Corps Volunteers Evacuate Abruptly"
		dict5["description"] = "When the agency suspended all operations for the first time in its history, more than 7,000 volunteers in about 60 countries packed their bags, said their goodbyes and rushed to get home."
		dict5["comments"] = "778"
		dict5["views"] = "44.9k"
		news.append(dict5)

		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	// MARK: - Helper methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func updateUI() {

		buttonTab1.titleLabel?.textColor = buttonTab1.isSelected ? AppColor.Theme : UIColor.label
		buttonTab2.titleLabel?.textColor = buttonTab2.isSelected ? AppColor.Theme : UIColor.label
		buttonTab3.titleLabel?.textColor = buttonTab3.isSelected ? AppColor.Theme : UIColor.label

		viewTab1.backgroundColor = buttonTab1.isSelected ? AppColor.Theme : UIColor.clear
		viewTab2.backgroundColor = buttonTab2.isSelected ? AppColor.Theme : UIColor.clear
		viewTab3.backgroundColor = buttonTab3.isSelected ? AppColor.Theme : UIColor.clear
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionAddList(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMenu(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMore(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionTab1(_ sender: UIButton) {

		print(#function)
		buttonTab1.isSelected = true
		buttonTab2.isSelected = false
		buttonTab3.isSelected = false
		updateUI()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionTab2(_ sender: UIButton) {

		print(#function)
		buttonTab1.isSelected = false
		buttonTab2.isSelected = true
		buttonTab3.isSelected = false
		updateUI()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionTab3(_ sender: UIButton) {

		print(#function)
		buttonTab1.isSelected = false
		buttonTab2.isSelected = false
		buttonTab3.isSelected = true
		updateUI()
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Profile2View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return news.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "Profile2Cell", for: indexPath) as! Profile2Cell
		cell.bindData(index: indexPath.item, data: news[indexPath.row])
		cell.buttonMore.addTarget(self, action: #selector(actionMore(_:)), for: .touchUpInside)
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Profile2View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return UITableView.automaticDimension
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

		return 200
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

		return viewHeader
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}
}
