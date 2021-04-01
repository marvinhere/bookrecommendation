<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\books;
use Illuminate\Support\Facades\Auth;


class UserDataRecommendation extends Controller
{
    //

    public function saveBook($id){
    	$user = Auth::user();
    	$userModel = User::find($user->id);
    	$userModel->interest()->attach($id);
    	return redirect('profile/'.$id)->with('status', 'Guardado en biblioteca!');
    }

    public function removeBook($id){
    	$user = Auth::user();
    	$userModel = User::find($user->id);
    	$userModel->interest()->detach($id);
    	return redirect('profile/'.$id)->with('status', 'Removido de biblioteca!');
    }

    public function library(){
        $user = Auth::user();
        $userModel = User::find($user->id);
        $interests = $userModel->interest;
        $data = [
            "interests"=>$interests
        ];
        return view('library')->with($data);
    }
}
